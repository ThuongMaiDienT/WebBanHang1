using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanHang.Models;

namespace WebBanHang.Controllers
{
    public class AccountController : Controller
    {
        SHOPEntities1 db = new SHOPEntities1();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult login()
        {
            var cki = Request.Cookies["user"];
            if (cki != null)
            {
                ViewBag.Id = cki.Values["Id"];
                ViewBag.Password = cki.Values["pw"];
            }
            return View();
        }
        [HttpPost]
        public ActionResult login(string Id, string Password, Boolean Remember)
        {
            var user = db.Customers.Find(Id);
            if (user == null)
            {
                ModelState.AddModelError("", "Sai tên đăng nhập");
            }
            else if (user.Password != Password)
            {
                ModelState.AddModelError("", "Sai mật khẩu");
            }
            else if (user.Activated == "false")
            {
                ModelState.AddModelError("", "Tài khoản chưa kích hoạt");
            }
            else
            {
                Session["user"] = user;
                ModelState.AddModelError("", "Đăng nhập thành công!");
                var cki = new HttpCookie("user");
                if (Remember == true)
                {
                    cki.Values["Id"] = Id;
                    cki.Values["pw"] = Password;
                    cki.Expires = DateTime.Now.AddMonths(1);

                }
                else
                {
                    cki.Expires = DateTime.Now.AddMonths(0);// xóa cookie
                }
                Response.Cookies.Add(cki);
            }
            return RedirectToAction("List","Product");
        }
        public ActionResult logout()
        {
            Session.Remove("user");
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(Customer model)
        {
            try
            {
                model.Activated ="false";
                db.Customers.Add(model);
                db.SaveChanges();
                ModelState.AddModelError("", "Đăng kí thành công, vui lòng nhận email kích hoạt tài khoản");
                var url = Request.Url.AbsoluteUri.Replace("Register", "") + "Activate/" + model.Id;
                var body = "Click vào liên kết để kích hoạt tài khoản:<a href='" + url + "'>Activate</a>";
                XMail.Send(model.Email, "Welcome mail", body);
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Đăng kí thất bại !");

            }
            return View();
        }
        public ActionResult Activate(string id)
        {
            var user = db.Customers.Find(id);
            user.Activated = "true";
            db.SaveChanges();
            return RedirectToAction("login");
        }
        public ActionResult registerseller()
        {
            return View();
        }
        [HttpPost]
        public ActionResult registerseller(Customer model)
        {
            return View();
        }

    }
}