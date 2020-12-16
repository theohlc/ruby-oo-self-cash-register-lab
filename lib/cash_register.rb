class CashRegister

    attr_reader :discount, :items, :previous_items, :previous_total
    attr_accessor :total
    
    def initialize(employee_discount = nil)
        @total = 0
        @items = []
        @discount = employee_discount
    end

    def add_item(title, price, quantity = 1)
        @previous_total = total
        @previous_items = items
        
        i = 0
        self.total = total + price*quantity
        while i < quantity
            items << title
            i += 1
        end
    end

    def apply_discount
        if discount == nil
            "There is no discount to apply."
        else
            self.total = (total*(100 - discount)/100)
            "After the discount, the total comes to $#{total}."
        end
    end

    def void_last_transaction
        @items = previous_items
        @total = previous_total
    end

end
