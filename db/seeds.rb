# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#KPI Creation
Kpi.create!(label: "SG&A sur CA");
Kpi.create!(label: "G&A sur CA");
Kpi.create!(label: "Coût fonction Finance sur CA");
Kpi.create!(label: "Coûts Informatiques sur CA");
Kpi.create!(label: "Coût fonction Commerciale sur CA");
Kpi.create!(label: "Coût Marketing sur CA");
Kpi.create!(label: "Salariés gérés par ETP RH");

#Aproach Creation
Approach.create!(label: "Global SG&A");
Approach.create!(label: "Fonction Finance");
Approach.create!(label: "Fonction RH");
Approach.create!(label: "Fonction IT");
Approach.create!(label: "Fonctions Marketing & Ventes");

#Activity Creation
Activity.create!(label: "Secteur financier");
Activity.create!(label: "Médias et communication");
Activity.create!(label: "Prestations Intellectuelles");
Activity.create!(label: "Industrie");
Activity.create!(label: "Technologies");
Activity.create!(label: "Energie");
Activity.create!(label: "Utilities");
Activity.create!(label: "Industrie pharmaceutique");
Activity.create!(label: "Transport et logistique");
Activity.create!(label: "Distribution");

#Size Creation
Size.create!(label: "CA < 500M€")
Size.create!(label: "CA entre 500M€ et 1Mrd€")
Size.create!(label: "CA entre 1Mrd€ et 10Mrd€")
Size.create!(label: "CA entre 10Mrd€ et 50Mrd€")
Size.create!(label: "CA > 50Mrd€")

#Bench Creation
Bench.create!(median_value: "8.13%", min_value:"28.84%", max_value:"2.65%", source:"https://saibooks.com/sga-benchmarks/", kpi_id: 1, approach_id: 1, activity_id:6, size_id:4)
Bench.create!(median_value: "17.31%", min_value:"37.88%", max_value:"7.19%", source:"https://saibooks.com/sga-benchmarks/", kpi_id: 1, approach_id: 1, activity_id:2, size_id:4)