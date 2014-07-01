//!javascript
//<adblock_subscriptions___SCRIPT
extensions.load("adblock_subscriptions", {
//<adblock_subscriptions___CONFIG

// Shortcut to subscribe to a filterlist
scSubscribe : null, 
// Command to subscribe to a filterlist
cmdSubscribe : "adblock_subscribe", 

// Shortcut to unsubscribe from a filterlist
scUnsubscribe : null, 

// Command to unsubscribe from a filterlist
cmdUnsubscribe : "adblock_unsubscribe",

// Shortcut to update subscriptions and reload filter rules
// Note that dwb will also update all subscriptions on startup
scUpdate : null, 

// Command to update subscriptions and reload filter rules
// Note that dwb will also update all subscriptions on startup
cmdUpdate : "adblock_update", 

// Path to the filterlist directory, will be created if it doesn't exist. 
filterListDir : data.configDir + "/adblock_lists"
//>adblock_subscriptions___CONFIG
});
//>adblock_subscriptions___SCRIPT
//<autoquvi___SCRIPT
extensions.load("autoquvi", {
//<autoquvi___CONFIG
// The quvi command
quvi      : "quvi",  

// External player command
player    : "mplayer %u", 

// Whether to automatically play videos if quvi finds a playable
// video
autoPlay  : true, 

// Whether to choose the quality before quvi starts
chooseQuality : true,

// A shortcut that spawns quvi for the current website
shortcut  : "",

// A command that spawns quvi for the current website 
command  : "autoquvi", 

// 
// Whether to autospawn quvi only in the active tab
activeOnly : true 

//>autoquvi___CONFIG
});
//>autoquvi___SCRIPT
//<multimarks___SCRIPT
extensions.load("multimarks", {
//<multimarks___CONFIG
// Adds current url to a multimark, if the mark doesn't exist a new one will be
// created
addMark : ",a", 
cmdAddMark : "mm_add",

// Add current url to a multimark, show a list of all exsiting
// multimarks, if the mark doesn't exist a new one will be
// created
addListedMark : ",A", 

// Open a multimark
openMark : ",o", 
cmdOpenMark : "mm_open",

// Open a multimark, show a list of all existing multimarks
openListedMark : ",O",

// If set to true multimarks shortest matching multimarks will be opened
// automatically, if set to false Return must be pressed
autoOpen : false, 
  
// Delete a multimark
deleteMark : ",d", 
cmdDeleteMark : "mm_delete",

// Delete a multimark, show a list of all existing multimarks
deleteListedMark : ",D", 

// Delete an url from a multimark, if it was the last url the multimark is
// deleted
deleteFromMark : ",f", 
cmdDeleteFromMark : "mm_remove",

// Delete an url from a multimark, if it was the last url the multimark is
// deleted
deleteFromListedMark : ",F",

// Shows all urls for a mark
showMark : ",s", 
cmdShowMark : "mm_show",

// Shows all urls for a mark, show a list of all existing marks
showListedMark : ",S" 

//>multimarks___CONFIG
});
//>multimarks___SCRIPT
//<formfiller___SCRIPT
extensions.load("formfiller", {
//<formfiller___CONFIG
// shortcut that gets and saves formdata
scGetForm : "efg",

// shortcut that fills a form
scFillForm : "eff",

// path to the formdata file
formData : data.configDir + "/forms",

// whether to use a gpg-encrypted file
useGPG : false,

// your GPG key ID (leave empty to use a symmetric cipher)
GPGKeyID : "",

// whether to use a GPG agent (requires non-empty GPGKeyID to work)
GPGAgent : false,

// additional arguments passed to gpg2 when encrypting the formdata
GPGOptEncrypt : "",

// additional arguments passed to gpg2 when decrypting the formdata
GPGOptDecrypt : "",

// whether to save the password in memory when gpg is used
keepPassword : true,

// whether to save the whole formdata in memory when gpg is used
keepFormdata : false

//>formfiller___CONFIG
});
//>formfiller___SCRIPT
