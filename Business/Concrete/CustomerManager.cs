using Business.Abstract;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
   public class CustomerManager :ICustomerService
    {
        ICustomerDal _customerDal;
        public CustomerManager(ICustomerDal customerDal)
        {
            _customerDal = customerDal;
        }

        public bool Add(Customer customer)
        {
            bool result;
            try
            {
                _customerDal.Add(customer);
                result = true;
            }
            catch (Exception ee)
            {
                result = false;

            }
            return result;
        }
        public IEnumerable<Customer> GetAll()
        {
            return _customerDal.GetAll();
        }

        public bool Delete(int ID)
        {

            bool result;
            try
            {
                Customer customer = _customerDal.Get(x => x.ID == ID);
                _customerDal.Delete(customer);
                result = true;
            }
            catch
            {
                result = false;

            }
            return result;
        }
    }
}
