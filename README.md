# Part Box

Part Box is an inventory and asset tracking system with consumables in mind. It essentially works like a standard asset tracking system, but it has funtions specific to
users who need to track consumables and move different things to different locations.

The basic idea is to use tags a little different than a standard asset tag. Tags are uniqe across the system, however if a part exists in multiple locations
it has multiple tags. This is to make finding the correct item to add to your BOM (bill of matierals) easier. Speaking of the BOM, this essentially works like a store
users create a new "order" in this order you can add line items that contain an asset tag number, from this number we can find the part and the location. Once the order is finalized the quantities are reduced in the consumables database. Using aset tags in this way allows us to track part quantities across different locations.

We also can track non-consumable assets, things like servers and hard drives. This is done much in the same way, however there is only a quantity of one item per tag.

# Requirements

- Redis
- pgsql


# Getting started
1. create a location
2. create a consumable
3. creat an asset tag to link the consumable and the location
4. create an order
5. add line items to the order, these are asset tag numbers.
6. finalize the order, and the quantity should reduce in the consumables table. (this doesnt work yet)

# TODO

- [x] Reduce quantity on order finlization
- [ ] Use asset tags rather than consumables in the line itmes
- [ ] display relevent info on all the views
- [ ] migrate everyhing to haml
- [ ] migrate all forms to simple form
- [ ] move to a product/part number linked to a consumable rather than only a consumable
- [ ] add all of the "fixed" asset tracking functions
- [ ] Handel unfinished consumable entry errors properly (missing asset tag shows nomethoderror)
- [ ] create a move scaffold and stuff
- [ ] Add working search
- [ ] fix line items not removing from database on updates
