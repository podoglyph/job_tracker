require 'rails_helper'

describe "User can delete a job" do
  scenario "a user can delete an existing job" do
    job = create(:job)

    visitcompany_job_path(job.company_id, job.id)

    expect(page).to have_content(job.title)


    click_button "Delete"

    expect(current_path).to eq("/companies/#{job.company_id}/jobs/#{job.id}")
    expect(page).to have_content("Fake Ass Organization")
    expect(page).to_not have_content(job.title)

  end
end
