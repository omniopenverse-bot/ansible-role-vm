NAME			= test

INVENTORY		= tests/inventory
PLAYBOOK		= tests/playbook.yml
ANSIBLE_CONFIG	= tests/ansible.cfg

all:					$(NAME)

$(NAME):
				ansible -m ping --inventory $(INVENTORY) all
				ansible-playbook --inventory $(INVENTORY) \
					--extra-var '{"vagrantoptions": "status", "host": "all"}' $(PLAYBOOK)


clean:

fclean:

re:				fclean $(NAME)

.PHONY:			all $(NAME) clean fclean re 