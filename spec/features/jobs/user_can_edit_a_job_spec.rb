require 'rails_helper'

describe "User can edit a job" do
  scenario "a user can edit an existing job" do
    job = create(:job)

    visit edit_company_job_path(job.company_id, job.id)

    expect(page).to have_content(job.title)

    fill_in "job[title]", with: "Fake Ass Organization"
    click_button "Update Job"

    expect(current_path).to eq("/companies/#{job.company_id}/jobs/#{job.id}")
    expect(page).to have_content("Fake Ass Organization")
    expect(page).to_not have_content(job.title)

  end
end
