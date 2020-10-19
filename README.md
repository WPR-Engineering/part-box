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
- elasticsearch
- RabbitMQ server up and running
- printing requires Partbox-Printer on our github

# Getting started
1. copy database.yml.examle to database.yml, change your
2. username/password/database name
3. copy /config/partbox-config.yml.example to /config/partbox-config.yml and make changes as needed
4. bundle instal
5. start redis if not already running
6. start exlasticsearch
7. db:migrate
8. bundl exec sidekiq
9. rails server

# Notes about printing
- You must be running Partbox-Printer. It works best if it runs on a dedicated label printer print server
- This is not particularly modular, its designed for zebra printers only specifically a GK420d
- labels are a fixed size
  - Small: 1.25x1”
  - Large: 2.25x4”
  - *coming soon!* Medium: 2.25x1.25”
- in /config/partbox-config.yml specify the CPUS print queue name for each label size. Even if you use the same queue for multiple label sizes you must specify it for each size

# TODO For V 1.0.0-Beta and on

- [x] Reduce quantity on order finalization
- [ ] Use asset tags rather than consumables in the line items
- [ ] display relevant info on all the views
  - [x] allow adding a line item to an order from the consumables view/tags link
  - [x] creating consumables also needs to display asset tags (asset tags now automatically created)
  - [ ] display more detail on "orders" page (part names at the very least)
- [ ] migrate everyhing to haml
- [ ] migrate all forms to simple form
- [x] move to a product/part number linked to a consumable rather than only a consumable
- [x] add all of the "fixed" asset tracking functions
- [x] Handel unfinished consumable entry errors properly (missing asset tag shows nomethoderror)
- [ ] create a move scaffold and stuff (to move assets between locations and bins) - this is required so we can track changes
- [x] Add working search
  - [ ] Fix search models to show good data and look pretty rather than just work.
- [x] fix line items not removing from database on updates
- [ ] style everything consistently
  - [ ] make sure everything is responsive
    - [ ] hide elements that wont be used on small screens
    - [ ] make navbar more funcational on small screens
- [x] make config for label printing more usable (its at least all in a config file, this will be expanded in future releases)
- [x] add support for zebra labels
- [x] associate users with orders
  - [ ] handle closed orders
- [ ] add "picking functionality" *in progress*
- [ ] implement change history on consumables via audited (audited already enabled on models) *up next*
  - [ ] display history on each consumable for how many were removed, when, and who removed them
  - [ ] create history page that shows the history for every action in the application
  - [ ] show moves on fixed assets 
- [x] Netbox API to get device names
  - [ ] Display netbox data proplery
  - [ ] store netbox info in partbox?
- [x] Fix "order" field showing up on asset_tags#show for fixed assets.
- [ ] Add a page to list all of the asset tags for a specific part type
- [ ] Make fixed asset disposal work *in progress*
  - [ ] hide destroy button on asset show pages
  - [ ] add reason to dispose option (add disposal_reason to fixed_assets)
  - [ ] make disposed assets view
- [x] handle multiple printers (see printer options in /config/partbox-config.yml)
