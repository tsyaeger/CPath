

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

//Used in user show page
Job.prototype.formatJobIndex = function() {
    return `<h3><a href='/users/${this.user_id}/jobs/${this.id}'>${this.company} - ${this.position}</a></h3>`
}



//Used in job show page
Job.prototype.appliedString = function() {
    let appString = this.applied.toString()
    return `<h3>APPLIED: ${appString}</h3>`
}

Job.prototype.appliedButton = function() {
    let text = this.applied ? 'Mark Not Applied' : 'Mark Applied'
    return `<button id='add-applied' data-bool="${this.applied}">${text}</button><br><br>`
}



//Used in other show pages
Job.prototype.formatSpan = function() {
    let spanItem = `<h3 class="w3-large">
        <i class="material-icons w3-large job" id=${this.id} data-id='${this.id}'>keyboard_arrow_down</i>
        <a href="/users/${this.user_id}/jobs/${this.id}">${this.company} - ${this.position}</a>
        </h3><span id='${this.id}' class='job remove-job ${this.id}' data-id='${this.id}' style="display: none;" >Remove</span><br>`
    return spanItem
}

