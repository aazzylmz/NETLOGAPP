using Business.Abstract;
using Business.Concrete;
using DataAccess.Concrete;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NETLOGAPP
{
    public partial class Urunler : System.Web.UI.Page
    {
        IItemService itemService = new ItemsManager(new EFItemDal());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridDoldur();
            }
        }
        protected void GrdCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Deletes") return;
            int id = Convert.ToInt32(e.CommandArgument);
            bool result = itemService.Delete(id);
            if (result)
            {
                RegisterStartupScript("", "<script>Notiflix.Notify.Success('Kayıt Silinmiştir.')</script>");
                GridDoldur();
            }
            else
            {
                RegisterStartupScript("", "<script>Notiflix.Notify.Failure('Kayıt Sırasında Hata oluştu.')</script>");

            }
        }

        protected void btnSave_Click(object sender,EventArgs e)
        {
            Items item = new Items();
            item.ITEMCODE = txtItemCode.Text;
            item.ITEMNAME = txtItemName.Text;
            item.PRICE =Convert.ToDecimal(txtItemPrice.Text);
            var result=itemService.Add(item);
            if (result)
            {
                RegisterStartupScript("", "<script>Notiflix.Notify.Success('Kayıt Başarılı.')</script>");
                GridDoldur();
                 
            }
            else
            {
                RegisterStartupScript("", "<script>Notiflix.Notify.Failure('Kayıt Sırasında Hata oluştu.')</script>");

            }
        }

        void GridDoldur()
        {
            GrdItem.DataSource = itemService.GetAll();
            GrdItem.DataBind();
        }
    }
}