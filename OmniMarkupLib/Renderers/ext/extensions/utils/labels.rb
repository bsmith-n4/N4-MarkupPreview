# A simple helper method handles the status of the target text.
# This is used to display whether a GitHub issue or a Jira ticket
# is open or closed etc.
module Labels
  # @param attrs [Array] attributes passed by the inline macro
  # @return [String] the status and/or label to be displayed
  def self.getstatus(attrs)
    status = attrs['status']
    if status == ('done' || 'closed')
      label = 'success'
    elsif status == 'open'
      label = 'warning'
    else
      status = 'unknown'
      label = 'default'
    end
  end
end
