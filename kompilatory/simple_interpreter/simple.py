import operator
# Token types
#
# EOF (end-of-file) token is used to indicate that
# there is no more input left for lexical analysis
INTEGER = 'INTEGER'
PLUS = 'PLUS'
MINUS = 'MINUS'
MULTIPLY = 'MULTIPLY'
DIVIDE = 'DIVIDE'
EOF = 'EOF'

operators = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '/': operator.truediv
}

sign_to_token = {
    '+': PLUS,
    '-': MINUS,
    '*': MULTIPLY,
    '/': DIVIDE
}


class Token(object):
    def __init__(self, type, value):
        # token type: INTEGER, PLUS, MINUS or EOF
        self.type = type
        # token value: 0, 1, 2. 3, 4, 5, 6, 7, 8, 9, '+', '-' or None
        self.value = value
        print(self)

    def __str__(self):
        return 'Token({type}, {value})'.format(
            type=self.type,
            value=repr(self.value)
        )

    def __repr__(self):
        return self.__str__()


class Interpreter(object):
    def __init__(self, text):
        self.text = text.strip()
        self.pos = 0
        self.current_token = None

    def error(self):
        raise Exception('Error parsing input')

    def skip_space(self, text):
        while text[self.pos] == ' ' and self.pos < len(text) - 1:
            self.pos += 1

    def get_next_token(self):
        """Lexical analyzer (also known as scanner or tokenizer)

        This method is responsible for breaking a sentence
        apart into tokens. One token at a time.
        """
        text = self.text

        if self.pos > len(text) - 1:
            return Token(EOF, None)

        self.skip_space(text)
        current_char = text[self.pos]
        if current_char.isdigit():
            start_pos = self.pos
            while current_char.isdigit() and self.pos < len(text) - 1:
                self.pos += 1
                current_char = text[self.pos]
            token = Token(INTEGER, int(text[start_pos:self.pos] if self.pos < len(text) - 1 else text[start_pos:]))
            self.pos += 1
            return token


        if current_char in sign_to_token:
            token = Token(sign_to_token[current_char], current_char)
            self.pos += 1
            return token

        self.error()

    def eat(self, token_type):
        if isinstance(token_type, str):
            token_type = [token_type]
        if self.current_token.type in token_type:
            self.current_token = self.get_next_token()
        else:
            self.error()

    def expr(self):
        self.current_token = self.get_next_token()

        left = self.current_token
        self.eat(INTEGER)

        op = self.current_token
        self.eat(sign_to_token.values())

        right = self.current_token
        self.eat(INTEGER)

        result = operators[op.value](left.value, right.value)
        return result


def main():
    while True:
        try:
            text = input('calc> ')
        except EOFError:
            break
        if not text:
            continue
        interpreter = Interpreter(text)
        result = interpreter.expr()
        print(result)


if __name__ == '__main__':
    main()
