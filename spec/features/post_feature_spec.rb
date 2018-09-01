require "rails_helper"

feature "#Post management" do
  scenario "index" do
    visit '/'
    expect(find('ul[@class="menu"]')).to have_link('Post')
    find('ul[@class="menu"]').click_link("Post")
  end

  given!(:post) { Post.create!(title: 'Post title 1', content: 'Post content 1.', quantity: 1) }

  scenario "show" do
    visit posts_path
    click_link 'Show'
  end

  scenario "create" do
    sign_in
    visit '/posts'

    expect(find('div.container')).to have_link('New Post')
    find('div.container').click_link("New Post")

    within("form#new_post") do
      expect(find('div[@class="form-group"]/label[@for="post_title"]')).to have_text('Title')
      fill_in "Title", :with => "Post title 10"
      expect(find('div[@class="form-group"]/label[@for="post_content"]')).to have_text('Content')
      fill_in "Content", :with => "Post content 10"
      expect(find('div[@class="form-group"]/label[@for="post_quantity"]')).to have_text('Quantity')
      fill_in "Quantity", :with => 10
    end

    expect(find('form#new_post')).to have_button('Create Post')
    find('form#new_post').click_button("Create Post")
    expect(page).to have_text("Post was successfully created.")
  end

  given(:new_post) { Post.new(title: 'Post title 2', content: 'Post content 2.', quantity: 2) }
  
  scenario 'update' do
    sign_in
    visit posts_path
    click_link 'Edit'

    within("form.edit_post") do
      fill_in 'Title', with: new_post.title
      fill_in 'Content', with: new_post.content
      fill_in 'Quantity', with: new_post.quantity
    end

    click_button 'Update Post'
    expect(page).to have_content 'Post was successfully updated.'
  end

  scenario 'destroy' do
    sign_in
    visit posts_path
    click_link 'Delete'
    expect(page).to have_content 'Post was successfully destroyed.'
    expect(page).not_to have_content post.title
  end

end