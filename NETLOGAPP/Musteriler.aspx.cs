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
    public partial class Musteriler : System.Web.UI.Page
    {
        ICustomerService customerService = new CustomerManager(new EFCustomerDal());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridDoldur();
            }
        }

        protected void btnSave_Click(object sender ,EventArgs e)
        {

            Customer customer = new Customer();
            customer.ADRESS = txtAdress.Text;
            customer.NAMEUSERNAME = txtCustomerName.Text;
            var result=customerService.Add(customer);
            if (result)
            {
                RegisterStartupScript("", "<script>Notiflix.Notify.Success('Kayıt Başarılı.')</script>");
                GridDoldur();
                txtAdress.Text = "";
                txtCustomerName.Text = "";
            }
            else
            {
                RegisterStartupScript("", "<script>Notiflix.Notify.Failure('Kayıt Sırasında Hata oluştu.')</script>");

            }
        }

        void GridDoldur()
        {
            GrdCustomer.DataSource = customerService.GetAll();
            GrdCustomer.DataBind();
        }

        protected void GrdCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Deletes") return;
            int id = Convert.ToInt32(e.CommandArgument);
            bool result = customerService.Delete(id);
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
    }
}