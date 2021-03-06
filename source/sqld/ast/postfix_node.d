
module sqld.ast.postfix_node;

import sqld.ast.expression_node;
import sqld.ast.unary_node;
import sqld.ast.visitor;

enum PostfixOperator : string
{
    isNull    = "IS NULL",
    isNotNull = "IS NOT NULL"
}

immutable class PostfixNode : UnaryNode
{
    mixin Visitable;

private:
    PostfixOperator _operator;

public:
    this(PostfixOperator operator, immutable(ExpressionNode) operand)
    {
        super(operand);
        _operator = operator;
    }

    @property
    PostfixOperator operator()
    {
        return _operator;
    }
}

@property
immutable(PostfixNode) isNull(immutable(ExpressionNode) node)
{
    return new immutable PostfixNode(PostfixOperator.isNull, node);
}

@property
immutable(PostfixNode) isNotNull(immutable(ExpressionNode) node)
{
    return new immutable PostfixNode(PostfixOperator.isNotNull, node);
}

immutable(PostfixNode) eq(LT, RT)(LT left, RT) if(isExpressionType!(LT) && is(RT == typeof(null)))
{
    return left.isNull;
}

immutable(PostfixNode) notEq(LT, RT)(LT left, RT) if(isExpressionType!(LT) && is(RT == typeof(null)))
{
    return left.isNotNull;
}
