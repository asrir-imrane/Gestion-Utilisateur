//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace User_Manage.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Utilisateur_Role
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Utilisateur_Role()
        {
            this.Application_Role_Autorisations = new HashSet<Application_Role_Autorisations>();
        }
    
        public int id_utilisateur_role { get; set; }
        public Nullable<int> id_utilisateur { get; set; }
        public Nullable<int> id_role { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Application_Role_Autorisations> Application_Role_Autorisations { get; set; }
        public virtual Role Role { get; set; }
        public virtual Utilisateurs Utilisateurs { get; set; }
    }
}
