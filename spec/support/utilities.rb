# Of course, this is essentially a duplicate of the helper in Listing 4.2 (./app/helpers/application_helper.rb), 
# but having two independent methods allows us to catch any typos in the base title. 
# This is dubious design, though, and a better (slightly more advanced) approach, 
# which tests the original full_title helper directly, appears in the exercises (Section 5.6).

def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end