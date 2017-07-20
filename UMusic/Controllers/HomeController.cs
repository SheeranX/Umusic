using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UMusic.Models;
using PagedList;
namespace UMusic.Controllers
{
    public class HomeController :Controller
    {
        //
        // GET: /Home/
        UMusicEntities musicDB = new UMusicEntities();
        public ActionResult Index()
        {
            ViewBag.Title = "Index.html";
            var albumInfo = new ListModel();

             albumInfo.albumModel= musicDB.tb_album.Take(6).ToList();
             albumInfo.artistModel = musicDB.tb_artist.Take(4).ToList();
            return View(albumInfo);  
        }
        /// <summary>
        /// 商品详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns>商品详细信息</returns>
        public ActionResult Product(int Id)
        {
            ViewBag.Title = "Album.html";
            var productInfo = new ListModel();
            SqlParameter prmId = new SqlParameter("@albumId",Id);
          
            productInfo.album = musicDB.tb_album.Find(Id);
            //获取专辑流派ID
            int genreid = (from al in musicDB.tb_album
                                      where al.albumId == Id
                                      select al.genreId).Single();
            //获取艺术家ID
            int artistid = (from al in musicDB.tb_album
                            where al.albumId == Id
                            select al.artistId).Single();

            productInfo.albumModel = (from al in musicDB.tb_album
                                      where al.genreId == genreid && al.artistId!=artistid
                                      select al).OrderBy(al=>al.locationId).Take(6).ToList();
            productInfo.artistAl = musicDB.Database.SqlQuery<tb_album>(
                   "exec albumProc @albumId ", prmId
                ).ToList();
                                   
            productInfo.artist = (from t in musicDB.tb_artist
                                 join b in musicDB.tb_album on t.artistId equals b.artistId
                                 where b.albumId == Id
                                 select t).Single();
                               
       
            return View(productInfo);
        }
        //artist details 
        public ActionResult Artist(int id) {
            var artistInfo = new ArtistDetails();
            //LINQ for artist
            artistInfo.artistSingle = (from at in musicDB.tb_artist
                                 where at.artistId == id
                                 select at).Single();
            //lamda expression of query album
            artistInfo.albumModel = (from al in musicDB.tb_album
                                     where al.artistId==id
                                     select al
                                         ).ToList();

           //the procedure for artist
            SqlParameter atId = new SqlParameter("@artistId",id);
            artistInfo.artistModel = (musicDB.Database.SqlQuery<tb_artist>(
                "exec artistProc @artistId",atId
                )).ToList();
            return View(artistInfo);
        }
       /// <summary>
       /// 专辑分类结果分页
       /// </summary>
       /// <param name="page"></param>
       /// <returns></returns>
        public ActionResult Album(int page=1) {
            var album = musicDB.tb_album.ToList();
            return View(album.ToPagedList(page,4));
        }
        /// <summary>
        /// 艺术家结果分页
        /// </summary>
        /// <param name="page"></param>
        /// <returns></returns>
        public ActionResult ArtistLooking(int page=1) {
            var artist = musicDB.tb_artist.ToList();
            return View(artist.ToPagedList(page,4));
        }
        /// <summary>
        /// 流派结果分页
        /// </summary>
        /// <param name="id"></param>
        /// <param name="page"></param>
        /// <returns></returns>
        public ActionResult Genre(int id,int page=1) {
            var genreAl = new Genre();
            genreAl.album = musicDB.tb_album.Where(x => x.genreId == id).ToList();
            genreAl.genre = musicDB.tb_genre.Where(x=>x.genreId==id).Single();
            ViewData["genre"] = genreAl.genre.genreName;
            ViewData["genreid"] = id;
            return View(genreAl.album.ToPagedList(page,12));
        }
        /// <summary>
        /// 地区结果分页
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Local(int id) {
            var localAl = new Local();
            localAl.album = musicDB.tb_album.Where(x => x.locationId == id).ToList();
            localAl.local = musicDB.tb_local.Where(x => x.localId==id).Single();
            return View(localAl);
        }
        /// <summary>
        /// 搜索方法
        /// </summary>
        /// <param name="inputSearch"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Search(string inputSearch)
        {
            var alat = new SearchResult();

            alat.album = (from al in musicDB.tb_album
                          where(al.albumName.Contains(inputSearch))
                         select al).Take(6).ToList();

            alat.artist = (from at in musicDB.tb_artist
                           where (at.artistName.Contains(inputSearch))
                           select at).Take(6).ToList();

            return View(alat);
        }

    }
}
