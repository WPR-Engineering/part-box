# Part Box

[![Build Status](https://travis-ci.org/WPR-Engineering/part-box.svg?branch=master)](https://travis-ci.org/WPR-Engineering/part-box)

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
bundle instal

# TODO (v0.0.1)

- [x] Reduce quantity on order finlization
- [ ] Use asset tags rather than consumables in the line itmes
- [ ] display relevent info on all the views
  - [ ] allow adding a line item to an order from the consumables view/tags link
  - [x] creating consumables also needs to display asset tags (asset tags now automatically created)
- [ ] migrate everyhing to haml
- [ ] migrate all forms to simple form
- [x] move to a product/part number linked to a consumable rather than only a consumable
- [x] add all of the "fixed" asset tracking functions
- [x] Handel unfinished consumable entry errors properly (missing asset tag shows nomethoderror)
- [ ] create a move scaffold and stuff
- [ ] Add working search
- [ ] fix line items not removing from database on updates
- [ ] style everything consistantly
- [ ] make config for label printing more usable
- [ ] associate users with orders
  - [ ] handle closed orders
- [ ] add "picking functionality"
- [ ] impliment change history on consumables via audited
