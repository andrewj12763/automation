defmodule ElixirSdetExerciseTest do
   # Import helpers
   use Hound.Helpers
   use ExUnit.Case
   require Logger
   # Start hound session and destroy when tests are run
   hound_session()

   ### ===VARIABLES=== ###
   @cPortal_email "testc@gmail.com"
   @cPortal_password "Welcome1"
   @loginPage "www.walmart.com"

   ### ===EXECUTE TESTS=== ###
   test "EXECUTE TEST" do
      set_window_size current_window_handle(), 1200, 1850 # RESIZES WINDOW
      cPortal_login() # LOGIN
      cPortal_myCart() # MY CART
   end

   ###########################
   ### ===CPORTAL LOGIN=== ###
   ###########################

   ### ===LOGIN=== ###
   def cPortal_login() do
      navigate_to(@loginPage)
      take_screenshot("CP0001-login_page.png")
      fill_field({:id, "emailTest"}, @cPortal_email)
      fill_field({:id, "passwordTest"}, @cPortal_password)
      click({:id, "login_button"})
      wait() # WAIT UNTIL PAGE IS LOADED
      take_screenshot("CP0002-cPortal_dashboard.png")
   end

   #############################
   ### ===CPORTAL MY CART=== ###
   #############################

   ### ===MY CART=== ###
   def cPortal_myCart() do
      myCart_inventory_addFavorites() # ADD TO FAVORITES
   end

   ### ===ADD TO FAVORITES=== ###
   def myCart_inventory_addFavorites() do
      :timer.sleep(1000)
      click({:css, "#invTableContent .item_row:nth-child(1) .fav_td .favorite_item"})
      :timer.sleep(500)
      click({:css, "#invTableContent .item_row:nth-child(2) .fav_td .favorite_item"})
      :timer.sleep(3000)
      take_screenshot("CP0007-cPortal_myCart_inventory_addFavorites.png")
   end

   ####################
   ### ===OTHER=== ####
   ####################

   ### ===WAT UNTIL PAGE IS LOADED=== ###
   def wait() do
      case execute_script("return document.readyState") do
         "loading" ->  wait() # WAIT UNTIL PAGE IS LOADED
         _ -> true
      end
  end
end