
function Task(task, user_id) {
	this.user_id = user_id
    this.id = task.id
    this.title = task.title
    this.desc = task.description
    this.due = task.due_date
}



Task.prototype.formatIndex = function() {
    let taskHTML = `<h3><a href="/users/${this.user_id}/tasks/${this.id}">${this.title} - ${this.due}</a></h3>`
    // let taskHTML = `<h3>testing</h3>`
    return taskHTML
}

Task.prototype.formatDate = function() {
	return 'date'
}


