using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebBanHang.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(int id)
        {
            ShoppingCart.Cart.Add(id, 1);
            var response = new
            {
                Count = ShoppingCart.Cart.Count,
                Amount = ShoppingCart.Cart.Amount
            };
            return Json(response, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Remove(int id)
        {
            ShoppingCart.Cart.Remove(id);
            var response = new
            {
                Count = ShoppingCart.Cart.Count,
                Amount = ShoppingCart.Cart.Amount
            };
            return Json(response, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Clear()
        {
            ShoppingCart.Cart.Clear();
            return View("Index");
        }
        public ActionResult Update()
        {
            foreach (var p in ShoppingCart.Cart.Items)
            {
                String txtname = p.Id.ToString();
                int newQty = int.Parse(Request[txtname]);
                p.Amount = newQty;
            }
            return View("Index");
        }
    }
}