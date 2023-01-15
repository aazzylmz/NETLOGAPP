using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IItemService
    {
        bool Add(Items item);
        IEnumerable<Items> GetAll();
        bool Delete(int ID);
    }
}
