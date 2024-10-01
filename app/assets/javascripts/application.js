import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "chartkick/chart.js"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


console.log('Hello World from Webpacker')
