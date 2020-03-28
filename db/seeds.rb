# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# services  = Service.new([{ category: Service.categories[:Consultation]}, { category: Service.categories[:Cooking]}, { category: Service.categories[:Tutoring]}, { category: Service.categories[:Music]}, { category: Service.categories[:Coaching]},  { category: Service.categories[:Languages]}])

Service.where( category: Service.categories[:Consultation]).first_or_create
Service.where( category: Service.categories[:Cooking]).first_or_create
Service.where( category: Service.categories[:Tutoring]).first_or_create
Service.where( category: Service.categories[:Music]).first_or_create
Service.where( category: Service.categories[:Coaching]).first_or_create
Service.where( category: Service.categories[:Languages]).first_or_create