//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Brio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class News
    {
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public int DivisionId { get; set; }
        public int AuthorUserId { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string Text { get; set; }
        public string Title { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual Division Division { get; set; }
        public virtual User User { get; set; }
    }
}
