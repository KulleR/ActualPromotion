//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Brio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Review
    {
        public int Id { get; set; }
        public System.DateTime Date { get; set; }
        public string Title { get; set; }
        public string ReviewMessage { get; set; }
        public string AutorPosition { get; set; }
        public string AuthorCompany { get; set; }
        public string AuthorPhoto { get; set; }
        public int CompanyId { get; set; }
    
        public virtual Company Company { get; set; }
    }
}
