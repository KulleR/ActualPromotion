﻿using Brio;
using Brio.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BrioPortal
{
    [Authorize]
    public class ProjectDocumentController : Controller
    {
        //
        // GET: /ProjectDocument/

        /// <summary>
        /// Предоставляет доступ к хранилищу данных о проектах
        /// </summary>
        private readonly IProjectRepository projectRepository;

        /// <summary>
        /// Предоставляет доступ к хранилищу данных документах проектов
        /// </summary>
        private readonly IProjectDocumentRepository projectDocumentRepository;


        private string uploadDirectory = "//Files//Documents//";

        public ProjectDocumentController(IProjectRepository _projectRepository, IProjectDocumentRepository _projectDocumentRepository)
        {
            this.projectRepository = _projectRepository;
            this.projectDocumentRepository = _projectDocumentRepository;
        }

        public ActionResult Index()
        {
            return View(projectRepository.GetAll().ToList());
        }

        public ActionResult GetProjectDocument()
        {
            return View();
        }

        public ActionResult Add(CreateProjectDocument projDoc, HttpPostedFileBase files)
        {
            if (ModelState.IsValid && (files != null && files.ContentLength > 0))
            {
                ProjectDocument projectDocument = new ProjectDocument();

                var fileName = Path.GetFileName(files.FileName);
                projectDocument.DocumentTitle = projDoc.Title;
                projectDocument.UploadDate = DateTime.Now;
                projectDocument.ProjectId = projDoc.ProjectId;

                var savingPath = Path.Combine(HttpContext.Server.MapPath(uploadDirectory), fileName);
                files.SaveAs(savingPath);
                projectDocument.DocumentPath = VirtualPathUtility.ToAbsolute(Path.Combine(uploadDirectory, fileName));

                projectDocumentRepository.Insert(projectDocument);
                projectDocumentRepository.SaveChanges();
                //throw new HttpException(403, "Forbidden");
            }
            return RedirectToAction("Index");
        }
    }
}
