# TeamRate

Team Rate is the base and foundation app for bringing teams together through food. 
It pushes the growth of teamwork before, during, and after any mealtime. This one was started for street food loving teams in San Francisco. 
Each member can put their own personal rating on each of the food trucks that they visit and then the team rate is to take the average of each of those scores and give each truck their overall rating according to each team. 
This allows faster meal decisions as well as more concise decisions to be executed as well. Plus with the tracked data the team can see exactly which places are their favorites which is a huge benefit for managers and other executives. Enough about possible obvious use cases, let's make it and start EATING!

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Great! We have the start of the app working. Now let's grab our food truck info. [This is the basic info we will be starting with in a CVS format](https://data.sfgov.org/api/views/rqzj-sfat/rows.csv) 
Next we need to open the file and then load in a few columns at the end for your team members and the collective team rate, one column per member and one for the team rate too. The code used is already set for reading 4 team members and one team rate. If needed to modify then please modify accordingly. 

The database needs to be configured to receive this information. Using Mix in the base of the project write 
$ mix phx.gen.html Food Truck trucks name:string address:string status:string food_items:string nate_rate:integer tess_rate:integer joe_rate:integer miao_rate:integer team_rate:integer
Then follow the instructions in the terminal.
This is for my team of 4, which consists of Nate (myself), Tess, Joe, and Miao, and one team rating. 
Now before running the file to upload the information to the database, the ratings in the database need to be nullable. That info can be found in the truck.ex file line 23 |> validate_required. Delete or comment out all of the ratings. Then run $ mix ecto.migrate.

Run the CSV file with $ TeamRate.Food.pull_rows_from_file(PATH TO FOODTRUCK CVS FILE, 0, 0)

Now you can visit [`localhost:4000/trucks`](http://localhost:4000/trucks) from your browser to see your uploaded trucks and then the ratings for each as well. All the ratings will be empty but they can be added using the Ecto in the CLI or using the GUI. Currently the team rating doesn't do automatic calculations. The feature will soon be added. 

ENJOI!!!

# rough-team-rate-app
