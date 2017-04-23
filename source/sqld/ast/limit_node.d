
module sqld.ast.limit_node;

import sqld.ast.node;
import sqld.ast.visitor;

class LimitNode : Node
{
    mixin Visitable;

private:
    ulong _limit;

public:
    this(ulong limit)
    {
        _limit = limit;
    }

    @property
    ulong limit() const
    {
        return _limit;
    }
}
