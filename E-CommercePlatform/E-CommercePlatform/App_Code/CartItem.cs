using System;

namespace E_CommercePlatform.AppCode
{
    [Serializable]
    public class CartItem
    {
        public string Name { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }

        public int Total => Price * Quantity;
    }
}
