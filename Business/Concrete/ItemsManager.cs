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
    public class ItemsManager :IItemService
    {
        IItemDal _itemDal;
        public ItemsManager(IItemDal itemDal)
        {
            _itemDal = itemDal;
        }

        public bool Add(Item item)
        {
            bool result;
            try
            {
                _itemDal.Add(item);
                result = true;
            }
            catch (Exception ee)
            {
                result = false;

            }
            return result;
        }
        public IEnumerable<Item> GetAll()
        {
            return _itemDal.GetAll();
        }

        public bool Delete(int ID)
        {

            bool result;
            try
            {
                Item item = _itemDal.Get(x => x.ID == ID);
                _itemDal.Delete(item);
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
