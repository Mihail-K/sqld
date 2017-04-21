
module sqld.ast.expression_list_node;

import sqld.ast.expression_node;
import sqld.ast.visitor;

import std.algorithm;
import std.array;

class ExpressionListNode : ExpressionNode
{
    mixin Visitable;

private:
    ExpressionNode[] _nodes;

public:
    this(ExpressionNode[] nodes)
    {
        _nodes = nodes.map!(flattenExpressionList)
                      .joiner
                      .array;
    }

    @property
    ExpressionNode[] nodes()
    {
        return _nodes;
    }
}

ExpressionNode[] flattenExpressionList(ExpressionNode node)
{
    if(auto list = cast(ExpressionListNode) node)
    {
        return list.nodes;
    }
    
    return [node];
}
