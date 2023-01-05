using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$nouns = 'work with Business Central', 'contribution to scrum', 'attitude', 'teamwork', 'banter', 'work ethic', 'code', 'feedback'
$adjectives = 'amazing', 'inspiring', 'great', 'funny', 'uplifting', 'invigorating', 'refreshing', 'fearless', 'creative', 'artistic', 'sincere'
$sentences = 'Your {0} is {1}.', 'I admire your {0}. It''s {1}', 'I really appreciate your {1} {0}', '{1} {0}!', 'Your {1} {0} is a real boost to the team. Thanks!', 'We all value your {0}. It''s {1}!', 'How do you do it? Your {0} is {1}!'

$body = ((Get-Random -InputObject $sentences) -f (Get-Random -InputObject $nouns), (Get-Random -InputObject $adjectives))

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})