using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHang.Models;

namespace WebBanHang.Controllers
{
    public class ProductController : Controller
    {
        SHOPEntities1 db = new SHOPEntities1();
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List()
        {
            var model = db.Products.ToList();
            return View(model);
        }
        public ActionResult ListBycate(int id)
        {
            Session["prodUrl"] = "/Product/ListBycate/" + id;
            var model = db.Products.Where(p => p.CategoryId == id).ToList();
            return View("List", model);

        }
        public ActionResult search(string keywords)
        {
            Session["prodUrl"] = "/Product/search?keyqword=" + keywords;
            var model = db.Products
               .Where(p => p.Name.Contains(keywords) ||
                   p.Category.NameVN.Contains(keywords)
                   ).ToList();
            return View("List", model);
        }
        public ActionResult ListBySpecial(string id)
        {
            Session["suppUrl"] = "/Product/ListBySpecial" + id;
            List<Product> model = null;
            switch (id)
            {
                case "Best":
                    model = db.OrderDetails
                        .GroupBy(d => d.Product)
                        .OrderByDescending(g => g.Sum(p => p.Quantity))
                        .Select(g => g.Key)
                        .Take(12).ToList();

                    break;
                //case "Lastest":
                //    model = db.Products.Where(p => p.Latest == true).ToList();
                //    break;
                //case "Discount":
                //    model = db.Products.Where(p => p.Discount > 0).ToList();
                //    break;
                //case "Special":
                //    model = db.Products.Where(p => p.Special == true).ToList();
                //    break;
                //case "ViewCount":
                //    model = db.Products
                //           .Where(p => p.Views > 0)
                //           .OrderByDescending(p => p.Views)
                //           .Take(12).ToList();
                 //   break;
                default:
                    model = db.Products.ToList();
                    break;
            }
            return View("List", model);
        }
        public ActionResult Detail(int id)
        {
            var model = db.Products.Find(id);
            // Tăng số lần xem
            // ghi nhận hàng đã xem
            var cki = Request.Cookies["Views"];
            if (cki == null)
            {
                cki = new HttpCookie("Views");
            }
            cki.Values[id.ToString()] = id.ToString();
            cki.Expires = DateTime.Now.AddDays(5);
            Response.Cookies.Add(cki);

            // truy vấn các mặt hàng đã xem
            var ids = cki.Values.AllKeys.Select(Id => int.Parse(Id));
            ViewBag.View = db.Products.Where(p => ids.Contains(p.Id)).ToList();
            return View(model);
        }


    }
}