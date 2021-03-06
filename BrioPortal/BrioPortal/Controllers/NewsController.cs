﻿using Brio;
using Brio.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BrioPortal.Controllers
{
    [Authorize]
    public class NewsController : Controller
    {
        //
        // GET: /News/

        /// <summary>
        /// Предоставляет доступ к хранилищу данных о новостях
        /// </summary>
        private readonly INewsRepository newsRepository;

        /// <summary>
        /// Предоставляет доступ к хранилищу данных о информационных карточках
        /// </summary>
        private readonly IInfoCardRepository infoCardRepository;

        /// <summary>
        /// Экземпляр класса BrioContext, предоставляет доступ к системным данным приложения.
        /// Может быть использован для доступа к текущему авторизованному пользователю
        /// </summary>
        private readonly IBrioContext brioContext;

        public NewsController(INewsRepository _newsRepository, IBrioContext _brioContext, IInfoCardRepository _infoCardRepository)
        {
            this.newsRepository = _newsRepository;
            this.brioContext = _brioContext;
            this.infoCardRepository = _infoCardRepository;
        }

        public ActionResult Index()
        {
            ViewBag.IsSuccess = TempData["IsSuccess"];
            ViewBag.Message = TempData["Message"];

            ViewBag.News = TempData["CreateNews"] != null ? TempData["CreateNews"] : new CreateNews();
            ViewBag.EditNews = TempData["EditNews"] != null ? TempData["EditNews"] : new EditNews();

            return View(newsRepository.GetAll(brioContext.CurrentUser.CompanyId));
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(EditNews model, HttpPostedFileBase PhotoPath)
        {
            if (ModelState.IsValid && (PhotoPath != null && PhotoPath.ContentLength > 0))
            {
                News news = newsRepository.GetById(model.Id);

                news.Title = model.Title;
                news.Text = model.Text;

                var fileName = Path.GetFileName(PhotoPath.FileName);

                var savingPath = Path.Combine(HttpContext.Server.MapPath(AppSettings.NEWS_PHOTO_SAVING_PATH), fileName);
                PhotoPath.SaveAs(savingPath);
                news.PhotoPath = VirtualPathUtility.ToAbsolute(Path.Combine(AppSettings.NEWS_PHOTO_SAVING_PATH, fileName));

                newsRepository.Update(news);
                newsRepository.SaveChanges();

                TempData["IsSuccess"] = true;
                TempData["Message"] = "Новость успешно изменена!";
                return RedirectToAction("Index");
            }
            else
            {
                TempData["IsSuccess"] = false;
                TempData["Message"] = "Новость не была изменена, т.к. не заполнены все поля. Пожалуйста повторите попытку заполнив все поля.";
                TempData["EditNews"] = model;
                return RedirectToAction("Index");
            }
        }

        [HttpPost]
        [Authorize(Roles="Admin")]
        public ActionResult Add(CreateNews model, HttpPostedFileBase PhotoPath)
        {
            if (ModelState.IsValid && (PhotoPath != null && PhotoPath.ContentLength > 0))
            {
                foreach (string word in model.Text.Split(' '))
                {
                    if (word.Length > 50)
                    {
                        TempData["IsSuccess"] = false;
                        TempData["Message"] = "Длинна одного слова не может быть больше 50 символов";
                        TempData["CreateNews"] = model;
                        return RedirectToAction("Index");
                    }
                }

                News news = new News
                {
                    Title = model.Title,
                    CreateDate = DateTime.Now,
                    AuthorUserId = brioContext.CurrentUser.ID,
                    CompanyId = brioContext.CurrentUser.CompanyId,
                    Text = model.Text
                };

                var fileName = Path.GetFileName(PhotoPath.FileName);

                var savingPath = Path.Combine(HttpContext.Server.MapPath(AppSettings.NEWS_PHOTO_SAVING_PATH), fileName);
                PhotoPath.SaveAs(savingPath);
                news.PhotoPath = VirtualPathUtility.ToAbsolute(Path.Combine(AppSettings.NEWS_PHOTO_SAVING_PATH, fileName));

                newsRepository.Insert(news);
                newsRepository.SaveChanges();

                TempData["IsSuccess"] = true;
                TempData["Message"] = "Новость успешно добавлена!";
                return RedirectToAction("Index");
            }
            else
            {
                TempData["IsSuccess"] = false;
                TempData["Message"] = "Новость не была создана, т.к. не заполнены все поля. Пожалуйста повторите попытку заполнив все поля.";
                TempData["CreateNews"] = model;
                return RedirectToAction("Index");
            }
        }

        public JsonResult GetNews(int id)
        {
            News news = newsRepository.GetById(id);
            if (news != null)
            {
                NewsDTO response = new NewsDTO
                {
                    AuthorUserId = news.AuthorUserId,
                    CompanyId = news.CompanyId,
                    CreateDate = news.CreateDate,
                    Id = news.ID,
                    Text = news.Text,
                    Title = news.Title,
                    PhotoPath = news.PhotoPath
                };

                return Json(ResponseProcessing.Success(response));
            }
            else
            {
                return Json(ResponseProcessing.Error("Невозможно извлечь новость. Обновите страницу и повторите попытку."));
            }
        }

        public ActionResult Delete(int id)
        {
            if (id > 0)
            {
                News doc = newsRepository.GetById(id);
                newsRepository.Delete(doc);
                newsRepository.SaveChanges();

                TempData["IsSuccess"] = true;
                TempData["Message"] = "Новость успешно удален!";
            }
            else
            {
                TempData["IsSuccess"] = false;
                TempData["Message"] = "Произошла ошибка, пожалуйста повторите попытку!";
            }

            return RedirectToAction("Index");
        }
    }
}
