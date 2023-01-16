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
    public partial class Siparisler : System.Web.UI.Page
    {
        IItemService itemService = new ItemsManager(new EFItemDal());
        ICustomerService customerService = new CustomerManager(new EFCustomerDal());
        IOrderService orderService = new OrderManager(new EFOrderFicheDal());
        IOrderLineService orderLineService = new OrderLineManager(new EFOrderLineDal());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LstDoldur();
                Musteri();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            OrderFiche orderFiche = new OrderFiche();
            List<OrderLine> orderLines = new List<OrderLine>();
            OrderLine orderLine = new OrderLine();
            decimal price = 0;
            orderFiche.CUSTOMERID = Convert.ToInt32(ddlCustomer.SelectedItem.Value);
            orderFiche.FICHENO = txtFicheNo.Text;
            orderFiche.ORDERTARİH = Convert.ToDateTime(txtOrderDate.Text);

            foreach (ListItem item in lsOrders.Items)
            {
                if (item.Selected)
                {
                    var resultItem = itemService.Get(Convert.ToInt32(item.Value));
                    price += resultItem.PRICE;
                    orderLine.AMOUNT = 1;
                    orderLine.ITEMID = Convert.ToInt32(item.Value);
                    orderLine.UNITPRICE = resultItem.PRICE;
                    orderLines.Add(orderLine);
                    orderLine = new OrderLine();
                }
            }


            orderFiche.TOTALPRICE = price;
            orderService.Add(orderFiche);
            var result = orderService.get(txtFicheNo.Text);
            foreach (var item in orderLines)
            {
                orderLine.ITEMID = item.ITEMID;
                orderLine.ORDERFICHEID = Convert.ToInt32(result.ID);
                orderLine.AMOUNT = 1;
                orderLine.UNITPRICE = item.UNITPRICE;
                orderLineService.Add(orderLine);
            }

        }

        void LstDoldur()
        {
            var items = itemService.GetAll();
            int i = 0;
            foreach (Items item in items)
            {

                lsOrders.Items.Insert(i, new ListItem(item.ITEMNAME, item.ID.ToString()));
                i++;
            }

        }
        void Musteri()
        {
            var customers = customerService.GetAll();
            int i = 0;
            foreach (Customer customer in customers)
            {

                ddlCustomer.Items.Insert(i, new ListItem(customer.NAMEUSERNAME, customer.ID.ToString()));
                i++;
            }
            ddlCustomer.Items.Insert(0, "Seçiniz");

        }
    }
}