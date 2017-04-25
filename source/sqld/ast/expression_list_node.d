
module sqld.ast.expression_list_node;

import sqld.ast.expression_node;
import sqld.ast.visitor;

import std.algorithm;
import std.array;
import std.meta;

class ExpressionListNode : ExpressionNode
{
    mixin Visitable;

private:
    ExpressionNode[] _nodes;

public:
    this(immutable(ExpressionNode)[] nodes) immutable
    {
        _nodes = nodes.map!(flattenExpressionList).joiner.array;
    }

    @property
    immutable(ExpressionNode)[] nodes() immutable
    {
        return _nodes;
    }

    immutable(ExpressionListNode) opBinary(string op : "~")(immutable(ExpressionNode) node) immutable
    {
        return new immutable ExpressionListNode(nodes ~ node);
    }

    immutable(ExpressionListNode) opBinary(string op : "~")(immutable(ExpressionNode)[] nodes) immutable
    {
        return new immutable ExpressionListNode(nodes ~ nodes);
    }

    immutable(ExpressionListNode) opBinary(string op : "~")(immutable(ExpressionListNode) node) immutable
    {
        return new immutable ExpressionListNode(nodes ~ node.nodes);
    }
}

immutable(ExpressionNode)[] flattenExpressionList(immutable(ExpressionNode) node)
{
    auto list = cast(immutable(ExpressionListNode)) node;
    return list ? list.nodes : [node];
}

immutable(ExpressionListNode) toExpressionList(TList...)(TList args) if(allSatisfy!(isExpressionType, TList))
{
    return new immutable ExpressionListNode(mixin("[" ~ [staticMap!(wrapExpression, args)].join(", ") ~ "]"));
}

private template wrapExpression(alias expression)
{
    enum wrapExpression = "toExpression(" ~ __traits(identifier, expression) ~ ")";
}
