mdp = QuickMDP(
    states       = [[State(x,y) for x=1:10, y=1:10]..., State(-1,-1)],
    actions      = [LEFT, RIGHT, UP, DOWN],
    initialstate = states,
    discount     = 0.95,
    isterminal   = s -> s==NULL_STATE,
    
    transition = function T(s, a)
        if R(s) != 0
            return Deterministic(params.null_state)
        end

        Nₐ = length(𝒜)
        next_states = Vector{State}(undef, Nₐ + 1)
        probabilities = zeros(Nₐ + 1)
        p_transition = params.p_transition

        for (i, a′) in enumerate(𝒜)
            prob = (a′ == a) ? p_transition : (1 - p_transition) / (Nₐ - 1)
            destination = s + movements[a′]
            next_states[i+1] = destination

            if inbounds(destination)
                probabilities[i+1] += prob
            end
        end
        
        # handle out-of-bounds transitions
        next_states[1] = s
        probabilities[1] = 1 - sum(probabilities)

        return SparseCat(next_states, probabilities)
    end,
    
    reward = function R(s, a=nothing)
        if s == State(4,3)
            return -10
        elseif s == State(4,6)
            return -5
        elseif s == State(9,3)
            return 10
        elseif s == State(8,8)
            return 3
        else
            return 0
        end     
    end
)
