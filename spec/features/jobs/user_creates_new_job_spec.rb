require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = create(:company)
    job = create(:job)
    visit new_company_job_path(company)

    fill_in "job[title]", with: job.title
    fill_in "job[description]", with: job.description
    fill_in "job[level_of_interest]", with: job.level_of_interest
    fill_in "job[city]", with: job.city

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end
end
