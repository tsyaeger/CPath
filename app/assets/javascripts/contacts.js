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


Contact.prototype.referenceString = function(ref_bool= this.reference) {
    let refString = ref_bool.toString()
    return `<h3>REFERENCE: ${refString}</h3>`
}

Contact.prototype.referenceButton = function(ref_bool= this.reference) {
    let text = ref_bool ? 'Remove From References' : 'Mark As Reference'
    return `<button id='add-reference' data-bool="${ref_bool}">${text}</button><br><br>`
}


Contact.prototype.formatSpan = function() {
    let spanItem = `<h3 class="w3-large">
        <i class="material-icons w3-large contact" id=${this.id} data-id='${this.id}'>keyboard_arrow_down</i>
        <a href="/users/${this.user_id}/contacts/${this.id}">${this.concatName()}</a>
        </h3><span id='${this.id}' class='contact remove-contact ${this.id}' data-id='${this.id}' style="display: none;" ><p class='remove'>Remove</p></span><br>`
    return spanItem
}