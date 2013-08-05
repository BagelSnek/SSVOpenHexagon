// Copyright (c) 2013 Vittorio Romeo
// License: Academic Free License ("AFL") v. 3.0
// AFL License page: http://opensource.org/licenses/AFL-3.0

#ifndef HG_ONLINE_CLIENTHANDLER
#define HG_ONLINE_CLIENTHANDLER

#include "SSVOpenHexagon/Core/HGDependencies.h"
#include "SSVOpenHexagon/Online/ManagedSocket.h"
#include "SSVOpenHexagon/Global/Typedefs.h"

namespace hg
{
	namespace Online
	{
		class Server;

		class ClientHandler
		{
			private:
				static unsigned int lastUid;
				unsigned int uid;
				ManagedSocket managedSocket;
				int untilTimeout{5};

			public:
				ssvu::Delegate<void()> onDisconnect;

				ClientHandler(PacketHandler& mPacketHandler) : uid{lastUid}, managedSocket(mPacketHandler)
				{
					++lastUid;

					managedSocket.onPacketReceived += [&]{ untilTimeout = 5; };
					std::thread([&]
					{
						while(true)
						{
							std::this_thread::sleep_for(std::chrono::milliseconds(800));
							if(!isBusy() || --untilTimeout > 0) continue;

							ssvu::lo << ssvu::lt("ClientHandler") << "Client (" << uid << ") timed out" << std::endl;
							onDisconnect(); managedSocket.disconnect();
						}
					}).detach();
				}

				inline bool send(const sf::Packet& mPacket)			{ return managedSocket.send(mPacket); }
				inline bool tryAccept(sf::TcpListener& mListener)	{ return managedSocket.tryAcceptCH(mListener, uid); }
				inline bool isBusy() const							{ return managedSocket.isBusy(); }
				inline unsigned int getUid() const					{ return uid; }
				inline ManagedSocket& getManagedSocket()			{ return managedSocket; }
				inline void refreshTimeout()						{ untilTimeout = 5; }
		};
	}
}

#endif
