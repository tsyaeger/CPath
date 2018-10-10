

// user_id=null
function Job(job, user_id) {
    this.user_id = user_id
    this.id = job.id
    this.company = job.company
    this.position = job.position
    this.url = job.url
    this.date_posted = job.date_posted
    this.applied = job.applied
    this.job_desc = job.job_desc
    this.co_desc = job.co_desc
}


Job.prototype.formatIndex = function() {
    return `<h3><a href='/users/${this.user_id}/jobs/${this.id}'>${this.company} - ${this.position}</a></h3>`
}


Job.prototype.appliedString = function() {
    let appString = this.applied.toString()
    return `<h3>APPLIED: ${appString}</h3>`
}

Job.prototype.appliedButton = function() {
    if (this.applied == true) {
        return `<button id='add-applied' data-bool="${this.applied}">Mark as not applied to</button><br><br>`
    }
    else {
        return `<button id='add-applied' data-bool="${this.applied}">Mark as applied to</button><br><br>`
    }
}


Job.prototype.datePosted = function() {
    let dateString = 'no date entered'
    if (this.date_posted) {
        let date = new Date(this.date_posted)
        dateString = date.toLocaleDateString()
    }
    return `<h3>POSTED DATE: ${dateString}</h3>`
}

Job.prototype.jobLink = function() {
    return `<h3 class='link'><a href="${this.url}">Link to Posting</a></h3>`
}

Job.prototype.jobTitle = function() {
    return `<span class="headline pg-btn btn-previous">Previous</span>
    <h1 id='job-company-position' class='headline'>${this.company} - ${this.position}</h1>
    <span class="headline pg-btn btn-next">Next</span>`
}


