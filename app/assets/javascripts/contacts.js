function Contact(contact, user_id) {
    this.user_id = user_id
    this.id = contact.id
    this.first = contact.first_name
    this.last = contact.last_name
    this.work = contact.workplace
    this.email = contact.email
    this.phone = contact.phone
    this.linkedin = contact.linkedin
    this.reference = contact.reference
}

Contact.prototype.concatName = function() {
    return `${this.first} ${this.last}` 
}

Contact.prototype.formatIndex = function() {
    return `<h3><a href='/users/${this.user_id}/contacts/${this.id}'>${this.first} ${this.last}</a></h3>`
}


Contact.prototype.referenceString = function() {
    let refString = this.reference.toString()
    return `<h3>REFERENCE: ${refString}</h3>`
}

Contact.prototype.referenceButton = function() {
    let text = this.reference ? 'Remove From References' : 'Mark As Reference'
    return `<button id='add-reference' data-bool="${this.reference}">${text}</button><br><br>`
}
