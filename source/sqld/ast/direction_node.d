
module sqld.ast.direction_node;

import sqld.ast.expression_node;
import sqld.ast.visitor;

enum Direction : string
{
    asc  = "ASC",
    desc = "DESC"
}

immutable class DirectionNode : ExpressionNode
{
    mixin Visitable;

private:
    ExpressionNode _node;
    Direction      _direction;

public:
    this(immutable(ExpressionNode) node, Direction direction)
    {
        _node      = node;
        _direction = direction;
    }

    @property
    immutable(ExpressionNode) node()
    {
        return _node;
    }

    @property
    Direction direction()
    {
        return _direction;
    }
}

@property
immutable(DirectionNode) asc(immutable(ExpressionNode) node)
{
    return new immutable DirectionNode(node, Direction.asc);
}

@property
immutable(DirectionNode) desc(immutable(ExpressionNode) node)
{
    return new immutable DirectionNode(node, Direction.desc);
}
