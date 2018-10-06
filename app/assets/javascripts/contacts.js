function Contact(contact, user_id) {
    this.user_id = user_id
    this.id = contact.id
    this.first = contact.first_name
    this.last = contact.last_name
    this.work = contact.workplace
    this.email = contact.email
    this.phone = contact.phone
    this.linkedin = contact.linkedin
}

Contact.prototype.concatName = function() {
    let concatName = `${this.first} ${this.last}` 
    return concatName
}

Contact.prototype.formatIndex = function() {
    let contactHTML = `<h3><a href='/users/${this.user_id}/contacts/${this.id}'>${this.first} ${this.last}</a></h3>`
    return contactHTML
}
