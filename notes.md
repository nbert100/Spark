Date Tracking App

User
    has_many :suitors
    has_many :dates through: :suitors
- name:string
- email:string
- password_digest
    

Location
belongs_to :date ?
- place (restaurant, show, etc)
- city

Suitor/Admirer?
belongs_to :user
has_many :dates
- name
- age



Date (join table)
belongs_to :user
belongs_to :suitor
- app used:string
- rating:integer