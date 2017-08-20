# $Arch: ssh-agent.fish,v 1.000 2017/08/14 04:56:52 kyau Exp $

function __ssh_agent_is_started -d "check if ssh agent is already started"
	if begin; test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"; end
		source $SSH_ENV > /dev/null
	end
	if test -z "$SSH_AGENT_PID"
		return 1
	end
	ps x | grep $SSH_AGENT_PID | grep -v grep | grep -q ssh-agent
	return $status
end

function __ssh_agent_start -d "start a new ssh agent"
	ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
	chmod 600 $SSH_ENV
	source $SSH_ENV > /dev/null
end
