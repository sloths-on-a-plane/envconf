{:user
 {:signing {:gpg-key "F499EF6C"}
  :test-refresh {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]}
  :plugins [;[lein-bin "0.3.4"]
            ;[codox "0.8.10"]
            ;[lein-kibit "0.0.8"]
            ;[jonase/eastwood "0.1.4"]
                                        ;[lein-bikeshed "0.1.7"]
            [com.jakemccrary/lein-test-refresh "0.11.0"]
            [cider/cider-nrepl "0.10.0"]]
  :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                 [aprint "0.1.3"]]}
 :injections [(use 'aprint.core)]}
