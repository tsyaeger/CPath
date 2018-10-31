

function Job(job, user_id) {
    this.user_id = user_id
    this.id = job.id
    this.company = job.company
    this.position = job.position
    this.url = job.url
    this.date_posted = job.date_posted  //SNAKE CASE THESE VARIABLES
    this.applied = job.applied
    this.job_desc = job.job_desc
    this.co_desc = job.co_desc
}



//Used in user show page
Job.prototype.formatJobIndex = function() {
    return `<h3><a href='/users/${this.user_id}/jobs/${this.id}'>${this.company} - ${this.position}</a></h3>`
}

//Used in job show page
Job.prototype.appliedString = function(applied_bool= this.applied) {
    let appString = applied_bool.toString()
    return `<h3 id='applied-bool'>Applied: ${appString.toUpperCase()}</h3>`
}

Job.prototype.appliedButton = function(applied_bool= this.applied) {
    let text = applied_bool ? 'Mark As Not Applied' : 'Mark As Applied'
    return `<button id='add-applied' data-bool="${applied_bool}">${text}</button><br><br>`
}

//Used in other show pages
Job.prototype.formatSpan = function() {
    let spanItem = `<h3 class="w3-large">
        <i class="material-icons w3-large job" id=${this.id} data-id='${this.id}'>keyboard_arrow_down</i>
        <a href="/users/${this.user_id}/jobs/${this.id}">${this.company} - ${this.position}</a>
        </h3><span id='${this.id}' class='job remove-job ${this.id}' data-id='${this.id}' style="display: none;" ><p class='remove'>Remove</p></span><br>`
    return spanItem
}

