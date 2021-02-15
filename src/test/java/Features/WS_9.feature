Feature: Generate a random session id

  Scenario: generate random session id
    * def random_string =
    """
    function(s) {
        var text = "";
        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for (var i = 0; i < s; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
        return text;
    }
    """
    * def sessionId =  random_string(10)
    Then print sessionId





