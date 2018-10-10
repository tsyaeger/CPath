
function Task(task, user_id) {
	this.user_id = user_id
    this.id = task.id
    this.title = task.title
    this.desc = task.description
    this.due = task.due_date
    this.document = task.document
    this.job = task.job
    this.contact = task.contact
}



Task.prototype.formatIndex = function() {
    let taskHTML = `<h3><a href="/users/${this.user_id}/tasks/${this.id}">${this.title} - ${this.formatDate()}</a></h3>`
    return taskHTML
}

Task.prototype.formatDate = function() {
    let date = new Date(this.due)
    dateString = date.toLocaleDateString()
    return dateString
}    



