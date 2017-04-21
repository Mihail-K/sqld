
module sqld.ast.unary_node;

import sqld.ast.expression_node;
import sqld.ast.visitor;

class UnaryNode : ExpressionNode
{
    mixin Visitable;

private:
    string         _operator;
    ExpressionNode _operand;

public:
    this(string operator, ExpressionNode operand)
    {
        _operator = operator;
        _operand  = operand;
    }

    @property
    string operator()
    {
        return _operator;
    }

    @property
    ExpressionNode operand()
    {
        return _operand;
    }
}
