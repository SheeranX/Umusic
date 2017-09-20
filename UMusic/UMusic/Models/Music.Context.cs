﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UMusic.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class UMusicEntities : DbContext
    {
        public UMusicEntities()
            : base("name=UMusicEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<tb_advice> tb_advice { get; set; }
        public DbSet<tb_album> tb_album { get; set; }
        public DbSet<tb_artist> tb_artist { get; set; }
        public DbSet<tb_cart> tb_cart { get; set; }
        public DbSet<tb_cartDetails> tb_cartDetails { get; set; }
        public DbSet<tb_collection> tb_collection { get; set; }
        public DbSet<tb_genre> tb_genre { get; set; }
        public DbSet<tb_local> tb_local { get; set; }
        public DbSet<tb_order> tb_order { get; set; }
        public DbSet<tb_orderDetails> tb_orderDetails { get; set; }
        public DbSet<tb_singleSong> tb_singleSong { get; set; }
        public DbSet<tb_user> tb_user { get; set; }
        public DbSet<view_cartItem> view_cartItem { get; set; }
        public DbSet<view_OrderItem> view_OrderItem { get; set; }
        public DbSet<view_UserCenterOrder> view_UserCenterOrder { get; set; }
        public DbSet<view_collection> view_collection { get; set; }
        public DbSet<sysdiagrams> sysdiagrams { get; set; }
        public DbSet<tb_admin> tb_admin { get; set; }
        public DbSet<tb_userDetails> tb_userDetails { get; set; }
    
        public virtual ObjectResult<albumProc_Result> albumProc(Nullable<int> albumId)
        {
            var albumIdParameter = albumId.HasValue ?
                new ObjectParameter("albumId", albumId) :
                new ObjectParameter("albumId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<albumProc_Result>("albumProc", albumIdParameter);
        }
    
        public virtual ObjectResult<artistProc_Result> artistProc(Nullable<int> artistId)
        {
            var artistIdParameter = artistId.HasValue ?
                new ObjectParameter("artistId", artistId) :
                new ObjectParameter("artistId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<artistProc_Result>("artistProc", artistIdParameter);
        }
    
        public virtual ObjectResult<proc_album_Result> proc_album(Nullable<int> orderid)
        {
            var orderidParameter = orderid.HasValue ?
                new ObjectParameter("orderid", orderid) :
                new ObjectParameter("orderid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_album_Result>("proc_album", orderidParameter);
        }
    
        public virtual ObjectResult<proc_artist_Result> proc_artist(Nullable<int> orderid)
        {
            var orderidParameter = orderid.HasValue ?
                new ObjectParameter("orderid", orderid) :
                new ObjectParameter("orderid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_artist_Result>("proc_artist", orderidParameter);
        }
    
        public virtual ObjectResult<proc_genre_Result> proc_genre(Nullable<int> orderid)
        {
            var orderidParameter = orderid.HasValue ?
                new ObjectParameter("orderid", orderid) :
                new ObjectParameter("orderid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_genre_Result>("proc_genre", orderidParameter);
        }
    
        public virtual ObjectResult<proc_listat_Result> proc_listat(Nullable<int> artistId)
        {
            var artistIdParameter = artistId.HasValue ?
                new ObjectParameter("artistId", artistId) :
                new ObjectParameter("artistId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_listat_Result>("proc_listat", artistIdParameter);
        }
    
        public virtual ObjectResult<proc_mulTable_Result> proc_mulTable()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_mulTable_Result>("proc_mulTable");
        }
    
        public virtual ObjectResult<Nullable<int>> proc_userid(string username)
        {
            var usernameParameter = username != null ?
                new ObjectParameter("username", username) :
                new ObjectParameter("username", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("proc_userid", usernameParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> GetCartaId(string username)
        {
            var usernameParameter = username != null ?
                new ObjectParameter("username", username) :
                new ObjectParameter("username", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("GetCartaId", usernameParameter);
        }
    
        public virtual ObjectResult<proc_calbum_Result> proc_calbum(Nullable<int> userid)
        {
            var useridParameter = userid.HasValue ?
                new ObjectParameter("userid", userid) :
                new ObjectParameter("userid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<proc_calbum_Result>("proc_calbum", useridParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    }
}